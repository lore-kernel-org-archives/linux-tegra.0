From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
Date: Fri, 31 Jan 2020 17:34:59 +0300
Message-ID: <aeced6f5-cd7d-bc57-ce83-541554a7dd40@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
 <00ce0f46-4401-c1da-5513-4aa38d224a44@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00ce0f46-4401-c1da-5513-4aa38d224a44@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org

31.01.2020 06:12, Sameer Pujar пишет:
> 
> 
> On 1/30/2020 10:55 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 30.01.2020 13:33, Sameer Pujar пишет:
>> ...
>>> +#include <linux/clk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +#include <sound/soc.h>
>>> +#include "tegra210_ahub.h"
>> Nit: I'd separate the per-directory includes with a blank line, like it
>> done by the most of existing drivers, for consistency.
> 
> Hi Dmitry,
> 
> I'd assume these are the only review comments (which includes your other
> replies for v2 5/9) for the series.
> Let me know otherwise.
> 
> It would help me to discuss all the issues at once, finalize changes for
> v3 and so that we can avoid multiple iterations.

Hello Sameer,

I'll take another look at the patches around Monday.

In general, you should wait for a week or two if you're expecting to get
more comments.

There is now more than month for you to finish this series. If you have
any other patches that depend on this series, then you may send them as
RFC and explicitly state that they depend on another series.
