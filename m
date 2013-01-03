From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DT: tegra: Add board level compatible properties
Date: Wed, 02 Jan 2013 17:13:52 -0700
Message-ID: <50E4CD40.10903@wwwdotorg.org>
References: <1357170831-7836-1-git-send-email-pengw@nvidia.com> <50E4CB34.6070205@wwwdotorg.org> <50E4CCB3.2040704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E4CCB3.2040704-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 05:11 PM, Peng Wu wrote:
> On 01/02/2013 04:05 PM, Stephen Warren wrote:
>> On 01/02/2013 04:53 PM, Bryan Wu wrote:
>>> The compatible properties of Tegra SoC based boards or machines need
>>> to be documented. This patch adds these board levle compatible
> 
> My bad, Stephen could you please help me to fix this typo when you
> merging this patch
> 'levle' -> 'level'

Sure, I'll patch that up when applying.

>> Do you have any idea when SATA support could be added?
>
> Oh, do you have SATA driver merged into upstream yet?

The driver isn't there yet, but it'd be great to add it.
