From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dynamically calculate pll_d parameters
Date: Tue, 18 Dec 2012 11:15:45 +0530
Message-ID: <50D00309.1080308@nvidia.com>
References: <1355767103-5303-1-git-send-email-dev@lynxeye.de> <50CF963E.7020506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF963E.7020506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 18 December 2012 03:31 AM, Stephen Warren wrote:
> On 12/17/2012 10:58 AM, Lucas Stach wrote:
>> Calculate PLL_D parameters in a dynamically instead of using a fixed
>> table. This allows TegraDRM to drive outputs with CVT compliant modes.
> Prashant, can you please review this, and comment on the best approach
> for dealing with the conflict this has with your clock driver rework.
> Thanks.
>
> Lucas, I assume this algorithm generates the same cpcon values (and
> indeed M/N/P values) as were in the fixed pll_d_freq_table before?

Stephen,

My clock driver rework includes automatic rate calculation if expected 
entry is not found in tables.
