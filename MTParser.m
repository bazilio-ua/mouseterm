
#line 1 "MTParser.rl"
#import <Cocoa/Cocoa.h>
#import <math.h>
#import "Mouse.h"
#import "MouseTerm.h"
#import "MTParser.h"
#import "MTParserState.h"
#import "MTShell.h"
#import "MTTabController.h"
#import "Terminal.h"


#line 78 "MTParser.rl"



#line 19 "MTParser.m"
static const char _EscapeSeqParser_actions[] = {
	0, 1, 0, 1, 3, 1, 4, 2, 
	1, 2, 2, 1, 5
};

static const char _EscapeSeqParser_key_offsets[] = {
	0, 1, 3, 7, 11, 13, 15, 19, 
	21, 24, 27, 29
};

static const char _EscapeSeqParser_trans_keys[] = {
	27, 27, 91, 27, 62, 63, 108, 27, 
	99, 48, 49, 27, 99, 27, 49, 27, 
	48, 104, 108, 27, 48, 27, 48, 51, 
	27, 104, 108, 27, 105, 27, 0
};

static const char _EscapeSeqParser_single_lengths[] = {
	1, 2, 4, 2, 2, 2, 4, 2, 
	1, 3, 2, 1
};

static const char _EscapeSeqParser_range_lengths[] = {
	0, 0, 0, 1, 0, 0, 0, 0, 
	1, 0, 0, 0
};

static const char _EscapeSeqParser_index_offsets[] = {
	0, 2, 5, 10, 14, 17, 20, 25, 
	28, 31, 35, 38
};

static const char _EscapeSeqParser_indicies[] = {
	1, 0, 1, 2, 0, 1, 3, 4, 
	5, 0, 1, 7, 6, 0, 1, 7, 
	0, 1, 8, 0, 1, 9, 10, 10, 
	0, 1, 11, 0, 1, 12, 0, 1, 
	13, 13, 0, 1, 14, 0, 1, 0, 
	0
};

static const char _EscapeSeqParser_trans_targs[] = {
	0, 1, 2, 3, 5, 10, 4, 11, 
	6, 7, 11, 8, 9, 11, 11
};

static const char _EscapeSeqParser_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 5, 
	0, 0, 7, 0, 3, 10, 1
};

static const int EscapeSeqParser_start = 11;
static const int EscapeSeqParser_first_final = 11;
static const int EscapeSeqParser_error = -1;

static const int EscapeSeqParser_en_main = 11;


#line 81 "MTParser.rl"

int MTParser_execute(const char* data, int len, BOOL isEof, id obj,
                     MTParserState* state)
{
    const char* p = data;
    const char* pe = data + len;
    const char* eof __attribute__((unused)) = isEof ? pe : 0;

    int cs = state.currentState;
    MTShell* mobj = (MTShell*) obj;
    [NSThread currentThread];

    
#line 92 "MTParser.m"
	{
	}

#line 94 "MTParser.rl"
    
#line 98 "MTParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
_resume:
	_keys = _EscapeSeqParser_trans_keys + _EscapeSeqParser_key_offsets[cs];
	_trans = _EscapeSeqParser_index_offsets[cs];

	_klen = _EscapeSeqParser_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _EscapeSeqParser_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	_trans = _EscapeSeqParser_indicies[_trans];
	cs = _EscapeSeqParser_trans_targs[_trans];

	if ( _EscapeSeqParser_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _EscapeSeqParser_actions + _EscapeSeqParser_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 14 "MTParser.rl"
	{}
	break;
	case 1:
#line 16 "MTParser.rl"
	{
        state.toggleState = ((*p) == 'h');
    }
	break;
	case 2:
#line 21 "MTParser.rl"
	{
        [mobj MouseTerm_setAppCursorMode: state.toggleState];
    }
	break;
	case 3:
#line 26 "MTParser.rl"
	{
        state.pendingMouseMode = ((*p) - 48);
    }
	break;
	case 4:
#line 31 "MTParser.rl"
	{
        state.handleSda = YES;
    }
	break;
	case 5:
#line 36 "MTParser.rl"
	{
        int mouseMode = state.pendingMouseMode;
        MouseMode newMouseMode = NO_MODE;
        switch (mouseMode)
        {
        case 0:
            newMouseMode = NORMAL_MODE;
            break;
        case 1:
            newMouseMode = HILITE_MODE;
            break;
        case 2:
            newMouseMode = BUTTON_MODE;
            break;
        case 3:
            newMouseMode = ALL_MODE;
            break;
        default:
            newMouseMode = NO_MODE;
        }
        if (newMouseMode != NO_MODE && state.toggleState)
            [mobj MouseTerm_setMouseMode: newMouseMode];
        else
            [mobj MouseTerm_setMouseMode: NO_MODE];
    }
	break;
#line 226 "MTParser.m"
		}
	}

_again:
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	}

#line 95 "MTParser.rl"

    state.currentState = cs;

    if (cs == EscapeSeqParser_error)
        return -1;
    if (cs >= EscapeSeqParser_first_final)
        return 1;
    return 0;
}
