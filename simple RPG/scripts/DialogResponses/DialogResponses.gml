// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogResponses(_responsecase){
switch (_responsecase) {
	case 0: break;
	case 1: NewTextBox("you gave repsonse A", 1); break;
	case 2: NewTextBox("you gave response B, more ?", 1, ["3: yes", "0: no"]); break;
	case 3: NewTextBox("thank for repsoonse", 0); break;
	case 4: {
		NewTextBox("Thanks adventure!", 2);
		NewTextBox("From what i remember, i lost it in the cave that\n have ton of purple slime!",2)
		NewTextBox("I'm not sure where the cave is,\nbut that is all i can remember", 2);
		global.questStatus[? "Find my hat"] = 1;
	} break;
	case 5: NewTextBox("Comeback if u change your mind.", 2); break;
	case 6: PurchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
	default: break;
	}
	
}