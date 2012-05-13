From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Stable I2C branch needed as a dependency for Tegra change
Date: Sat, 12 May 2012 22:21:59 -0600
Message-ID: <4FAF36E7.1070104@wwwdotorg.org>
References: <4FA31297.8000904@wwwdotorg.org> <20120512184515.GC28973@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120512184515.GC28973-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/12/2012 12:45 PM, Wolfram Sang wrote:
> Hi,
> 
>> Is your i2c-embedded/for-next branch stable (i.e. that commit
>> will not be rebased between now and when you send a pull request
>> for 3.5), so I can use it as a baseline for a Tegra branch? If
>> not, could you let me know when it is stable, so I can create the
>> Tegra branch as that time.
> 
> Because of my holidays coming along, I'd think my for-next branch
> is done now (except for additions maybe). Yet, when and how to
> rewind the branch and/or offering a stable base in general is
> another thing I need to scratch my head about afterwards.

No worries then; I'll hold the dependent patch until 3.6; that way
there won't be any specific dependencies.
