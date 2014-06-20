From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Fri, 20 Jun 2014 18:49:15 +0900
Message-ID: <53A4039B.7000504@nvidia.com>
References: <1403164154-1362-1-git-send-email-acourbot@nvidia.com> <53A308C8.2070004@wwwdotorg.org> <20140619175643.GR5099@sirena.org.uk> <53A3C613.8030207@nvidia.com> <53A3D85E.7030704@nvidia.com> <20140620094119.GT5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140620094119.GT5099-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/20/2014 06:41 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Jun 20, 2014 at 03:44:46PM +0900, Alexandre Courbot wrote:
>
>> dbabd624d
>> regulator: palmas: Reemove open coded functions with helper functions
>
>> Keerthy, Nishanth, could it be that there is still something wrong with the
>> REGULATOR_LINEAR_RANGE() definitions?
>
>> This seems to be the cause for our trouble, but the other questions might
>> still stand, in case there is interest in discussing them.
>
> There was a bug fix to the Palmas driver which just went to Linus the
> other day, are you sure this isn't fixed in mainline (or -next, it's
> been in -next for a week or something)?

If you are talking about

6b7f2d82d5
regulator: palmas: Fix SMPS list for 0V

then it is in my tree. There is actually no difference on 
palmas-regulator.c between my tree and the current -next (or Linus' tree 
for that instance).

So it seems to be something else we are dealing with here.
