From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2 33/63] clocksource/drivers/time-armada-370-xp: Convert
 init function to return error
Date: Fri, 17 Jun 2016 10:09:43 +0200
Message-ID: <5763B047.1010903@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-34-git-send-email-daniel.lezcano@linaro.org>
 <5763A4F4.30102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5763A4F4.30102@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 06/17/2016 09:21 AM, Jon Hunter wrote:
>
> On 16/06/16 22:26, Daniel Lezcano wrote:
>> The init functions do not return any error. They behave as the follo=
wing:
>>
>>    - panic, thus leading to a kernel crash while another timer may w=
ork and
>>         make the system boot up correctly
>>
>>    or
>>
>>    - print an error and let the caller unaware if the state of the s=
ystem
>>
>> Change that by converting the init functions to return an error conf=
orming
>> to the CLOCKSOURCE_OF_RET prototype.
>>
>> Proper error handling (rollback, errno value) will be changed later =
case
>> by case, thus this change just return back an error or success in th=
e init
>> function.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>   drivers/clocksource/tegra20_timer.c | 28 ++++++++++++++++---------=
---
>>   1 file changed, 16 insertions(+), 12 deletions(-)
>
> The $subject does not appear to match with the driver you are modifyi=
ng
> here.

Ah, crap. I introduced a shift somewhere in the patchset. Fixed.

Thanks !

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
