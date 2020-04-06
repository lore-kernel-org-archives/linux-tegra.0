From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 7 Apr 2020 00:11:13 +0300
Message-ID: <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc: sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.04.2020 00:02, Sowjanya Komatineni пишет:
>>>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>> on more than 2 frames captures, it breaks thread and on next wakeup it
>>>>> continues
>>>> The wait_event() won't wait if condition is true.
>>> condition is checked when waitqueue is woken up
>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
> 
> process is put to sleep until the condition evaluates to true or signal
> is received.
> 
> condition is checked each time the waitqueue head is woken up.

This is a wrong assumption in accordance to the code.
