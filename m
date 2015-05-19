From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] pinctrl: tegra-xusb: Check that of_match_node returns
 a valid pointer
Date: Tue, 19 May 2015 15:29:06 +0100
Message-ID: <555B48B2.3040006@nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com> <1432044863-2035-4-git-send-email-jonathanh@nvidia.com> <20150519141836.GB26748@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150519141836.GB26748-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/05/15 15:18, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 19, 2015 at 03:14:23PM +0100, Jon Hunter wrote:
>> of_match_node() will return NULL if no match is found and so check for
>> this before dereferencing the pointer.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/pinctrl/pinctrl-tegra-xusb.c | 3 +++
>>  1 file changed, 3 insertions(+)
> 
> This isn't necessary. The driver is probed from DT only and therefore
> .probe() will only be called if there's a matching entry in the OF
> device ID table. match can never be NULL.

Ah, ok that would make sense.

Cheers Jon
