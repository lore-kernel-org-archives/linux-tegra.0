From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable I2C Mux driver for PCA9546 in defconfig
Date: Wed, 12 Feb 2014 12:09:18 -0800
Message-ID: <CAK5ve-+bzLkdwmab9sZGPk7p67ktVcK3mHQ2aUgMueH061ty6w@mail.gmail.com>
References: <1391817298-10600-1-git-send-email-pengw@nvidia.com> <52FBC6A9.7010401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FBC6A9.7010401-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 12, 2014 at 11:08 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/07/2014 04:54 PM, Bryan Wu wrote:
>> PCA9546 is used in Cardhu Tegra30 board to connect to 3 cameras.
>> Enabling this driver for Tegra V4L2 soc camera driver and camera
>> sensor drivers.
>
> I've squashed patch 1/2 into Tegra's for-3.15/defconfig branch, and
> applied patch 2/2 to Tegra's for-3.15/dt branch.
>
> Note that your patches were sent with an email "From" address that
> didn't match your signed-off-by tag, yet "git send-email" didn't insert
> a "From" header in the email body. Can you please check your git user ID
> and/or email settings. Consequently, I had to adjust the git author
> field in git to match your s-o-b line.

My bad. I need to update my git send-email script to use --from "Bryan
Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>" instead of --from "Bryan Wu
<cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>"

Need I resubmit this patchset?

Thanks,
-Bryan
