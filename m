From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
Date: Fri, 31 Jan 2020 08:42:28 +0530
Message-ID: <00ce0f46-4401-c1da-5513-4aa38d224a44@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <160bb2ca-89bb-0ecf-a334-0fac591b439a@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
Cc: spujar@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 1/30/2020 10:55 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <sound/soc.h>
>> +#include "tegra210_ahub.h"
> Nit: I'd separate the per-directory includes with a blank line, like it
> done by the most of existing drivers, for consistency.

Hi Dmitry,

I'd assume these are the only review comments (which includes your other=20
replies for v2 5/9) for the series.
Let me know otherwise.

It would help me to discuss all the issues at once, finalize changes for=20
v3 and so that we can avoid multiple iterations.

Thanks,
Sameer.
