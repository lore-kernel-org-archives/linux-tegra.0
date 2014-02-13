From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable I2C Mux driver for PCA9546 in defconfig
Date: Wed, 12 Feb 2014 18:22:23 -0800
Message-ID: <CAK5ve-LYSBiZ9VhGMgz_tw4akVz_Pzr3EHbmeBeZsC3YaHFV-g@mail.gmail.com>
References: <1391817298-10600-1-git-send-email-pengw@nvidia.com>
 <52FBC6A9.7010401@wwwdotorg.org> <CAK5ve-+bzLkdwmab9sZGPk7p67ktVcK3mHQ2aUgMueH061ty6w@mail.gmail.com>
 <52FBD6C9.2010905@wwwdotorg.org> <CAK5ve-+2AGO0UCf4UOMLoqGmQLp7QN08OJbZxUc-oYZzjPdFcQ@mail.gmail.com>
 <52FBF739.1060605@wwwdotorg.org> <CAK5ve-LHktOUNUYRZccvmmYwcAhvQiPQYoxEWkVU6kUHr4aTUQ@mail.gmail.com>
 <52FC2A1A.2070305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FC2A1A.2070305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 12, 2014 at 6:12 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/12/2014 04:23 PM, Bryan Wu wrote:
> ...
>> Sure, I think I just missed to set the author as @nvidia.com but SOB
>> is @nvidia.com in this patchset. And I still should use --from "Bryan
>> Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>" for sending out email from gmail server.
>> Right?
>
> I think you want the following in ~/.gitconfig:
>
> [user]
>         name = Bryan Wu
>         email = pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org

I have these settings in my company machine.

> [sendemail]
>         from = Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> I assume "--from xxx" is the same as setting the last variable I listed
> above.

Yeah, I didn't put this in my .gitconfig but put them in my script
with "git send-mail".

Thanks,
-Bryan
