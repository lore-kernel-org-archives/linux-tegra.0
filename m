From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 00/19] Introduce common infra for tegra clocks
Date: Wed, 16 Oct 2013 11:14:27 -0600
Message-ID: <525EC973.7060802@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <525D8009.5040907@wwwdotorg.org> <20131016090643.GI5643@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016090643.GI5643-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 03:06 AM, Peter De Schrijver wrote:
> On Tue, Oct 15, 2013 at 07:48:57PM +0200, Stephen Warren wrote:
>> On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
>>> This patchset introduces common infrastructure for clocks which exist in                                                                                       
>>> several Tegra SoCs. We also also move Tegra20, Tegra30 and Tegra114 to
>>> this new infrastructure.
...
>> Testing on Venice2 (Tegra124): I see the following WARN during boot,
>> which I think is new relative to the internal branch you gave me yesterday:
>>
>>> [    0.300450] WARNING: CPU: 0 PID: 1 at drivers/clk/tegra/clk.c:187 tegra_init_from_table+0x78/0x158()
...
>>> [    0.372440] [<c07b4c1c>] (tegra_init_from_table+0x78/0x158) from [<c07b4e10>] (tegra_clocks_apply_init_table+0x18/0x20)
>>> [    0.384138] [<c07b4e10>] (tegra_clocks_apply_init_table+0x18/0x20) from [<c079f9cc>] (tegra_dt_init+0xc/0xd8)
>>> [    0.394903] [<c079f9cc>] (tegra_dt_init+0xc/0xd8) from [<c079a580>] (customize_machine+0x1c/0x40)
...
> Did you see  'tegra_init_from_table: Failed to set parent pll_c2 of epp ' before? Tegra124 doesn't have EPP...

Yes, I get exactly that message. Sorry, I forgot to paste in the most
relevant line:-( I assume fixing this simply means removing an entry in
the init table in clk-tegra124.c, so should be simple.
