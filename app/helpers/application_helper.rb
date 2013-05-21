module ApplicationHelper

  def random_rotation_css
    rotate = -20 + rand(40)
    margin_top = -30 + rand(60)
    margin_left = -40 + rand(80)
<<-END
transform: rotate(#{rotate}deg);
-ms-transform: rotate(#{rotate}deg); /* IE 9 */
-webkit-transform: rotate(#{rotate}deg); /* Safari and Chrome */
margin-top: #{margin_top}px;
margin-left: #{margin_left}px;
END
  end
end
