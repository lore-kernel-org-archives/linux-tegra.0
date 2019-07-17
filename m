From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 11/24] PM / devfreq: tegra30: Add debug messages
Date: Wed, 17 Jul 2019 18:46:48 +0300
Message-ID: <f819c226-4328-c85d-5da3-932391fa6747@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223640epcas4p15337f40466342832b731ad6a53be946e@epcas4p1.samsung.com>
 <20190707223303.6755-12-digetx@gmail.com>
 <c883bdbe-427f-35a1-9e63-5e4953a84286@samsung.com>
 <53cd0ba5-f814-cd9b-19c5-1d42717ca58c@gmail.com>
 <922c9178-71de-46ad-eafd-805af461bedb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <922c9178-71de-46ad-eafd-805af461bedb@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.07.2019 9:45, Chanwoo Choi пишет:
> On 19. 7. 16. 오후 10:26, Dmitry Osipenko wrote:
>> 16.07.2019 15:23, Chanwoo Choi пишет:
>>> Hi Dmitry,
>>>
>>> Usually, the kernel log print for all users
>>> such as changing the frequency, fail or success.
>>>
>>> But, if the log just show the register dump,
>>> it is not useful for all users. It is just used
>>> for only specific developer.
>>>
>>> I recommend that you better to add more exception handling
>>> code on many points instead of just showing the register dump.
>>
>> The debug messages are not users, but for developers. Yes, I primarily
>> made the debugging to be useful for myself and will be happy to change
>> the way debugging is done if there will be any other active developer
>> for this driver. The registers dump is more than enough in order to
>> understand what's going on, I don't see any real need to change anything
>> here for now.
> 
> Basically, we have to develop code and add the log for anyone.
> As you commented, even if there are no other developer, we never
> guarantee this assumption forever. And also, if added debug message
> for only you, you can add them when testing it temporarily.
> 
> If you want to add the just register dump log for you,
> I can't agree. Once again, I hope that anyone understand
> the meaning of debug message as much possible as.
> 

The registers dump should be good for everyone because it's a
self-explanatory information for anyone who is familiar with the
hardware. I don't think there is a need for anything else than what is
proposed in this patch, at least for now. I also simply don't see any
other better way to debug the state of this particular hardware, again
this logging is for the driver developers and not for users.

Initially, I was temporarily adding the debug messages. Now they are
pretty much mandatory for verifying that driver is working properly. And
of course the debugging messages got into the shape of this patch after
several iterations of refinements. So again, I suppose that this should
be good enough for everyone who is familiar with the hardware. And of
course I'm open to the constructive suggestions, the debugging aid is
not an ABI and could be changed/improved at any time.

You're suggesting to break down the debugging into several smaller
pieces, but I'm finding that as not a constructive suggestion because
the information about the full hardware state is actually necessary for
the productive debugging.
