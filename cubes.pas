program cubes;
const lower=0; upper=999;
var count:Word; //global
    iter:LongInt; //global
    a,b,c:Word;
    s,n:LongInt;

procedure message2(a,b,c:Word; n:LongInt);
begin
    WriteLn(a:3,'^3 + ',b:3,'^3 + ',c:3,'^3 = ',n:9);
end;

begin
    count:=0; iter:=0;
    for a:=lower to upper do begin
        for b:=lower to upper do begin
            for c:=lower to upper do begin
                s:=a*a*a+b*b*b+c*c*c;
                n:=a*1000000+b*1000+c;
                if s=n then begin
                    message2(a,b,c,n);
                    Inc(count);
                end;
                Inc(iter);
                if s>=1000000000 then break;
            end
        end
    end;
    WriteLn('Found ',count,' triplets in ',iter,' iterations.');
end.