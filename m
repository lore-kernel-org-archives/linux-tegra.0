From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] soc: tegra: pmc: Various fixes
Date: Thu, 11 Feb 2016 15:13:21 -0700
Message-ID: <CANLsYkymp3jP7Df3ts6tGNdTL4AGFKPPAC6Eu-gMvFBCKXR89w@mail.gmail.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
	<56BCCFCA.4010009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BCCFCA.4010009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11 February 2016 at 11:15, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> +Mathieu, sorry I should have copied you. I recall that you had some
> comments on this. I guess you are not on linux-tegra, but you can view
> the patches here:
>
> http://marc.info/?l=linux-tegra&r=1&b=201602&w=2

Thanks for fixing patch 2 and 3, this is much better.  I've also
reviewed the other patches and things do look good to me.

For the whole set,
Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>
> Jon
>
> On 11/02/16 18:03, Jon Hunter wrote:
>> This series contains a few fixes on the Tegra PMC driver. Some of these
>> patches were original included as part of the series to add generic PM
>> domain support for Tegra [0]. However, to keep these patch series a
>> manageable size, I have separate them in to this series and I have added
>> a couple more fixes as well.
>>
>> [0] http://marc.info/?l=linux-tegra&m=145399885003830&w=2
>>
>> Jon Hunter (8):
>>   soc: tegra: pmc: Remove non-existing L2 partition for Tegra124
>>   soc: tegra: pmc: Restore base address on probe failure
>>   soc: tegra: pmc: Protect public functions from potential race
>>     conditions
>>   soc: tegra: pmc: Change powergate and rail IDs to be an unsigned type
>>   soc: tegra: pmc: Fix testing of powergate state
>>   soc: tegra: pmc: Fix verification of valid partitions
>>   soc: tegra: pmc: Remove additional check for a valid partition
>>   soc: tegra: pmc: Ensure GPU partition can be toggled on/off by PMC
>>
>>  drivers/gpu/drm/tegra/drm.h |   2 +-
>>  drivers/soc/tegra/pmc.c     | 131 +++++++++++++++++++++++++++++---------------
>>  include/soc/tegra/pmc.h     |  35 ++++++------
>>  3 files changed, 105 insertions(+), 63 deletions(-)
>>
