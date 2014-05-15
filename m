From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/panel: add support for EDT panels
Date: Thu, 15 May 2014 10:24:39 +0200
Message-ID: <4de1d09b7873e012e43525c1f8ab9c66@agner.ch>
References: <cover.1400103181.git.stefan@agner.ch>
 <35c081171a3d9a9401767601c02a12e266b37dd0.1400103181.git.stefan@agner.ch>
 <20140515075102.GE5952@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515075102.GE5952@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry, hi Philipp,

Am 2014-05-15 09:51, schrieb Thierry Reding:
> On Wed, May 14, 2014 at 11:45:57PM +0200, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
>> From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>
>> This panels are sold by Toradex for Colibri T20/T30 and Apalis T30
>> evaluation kits.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> Panel patches should go to the dri-devel mailing list as well.
> 
> Also a patch was posted only yesterday for a panel that seems to be the
> exact same one as this, even though the name differs minimally, see:
> 
> 	https://patchwork.kernel.org/patch/4175251/
> 
> Adding Philipp on Cc so you guys can work together whether this is
> indeed the same panel. The only differences seem to be in the vertical
> front and back porches, but I suspect that either settings will work on
> both Tegra and i.MX.

Its etm0700g0dh6 vs. et070080dh6, Philipp's panel is with captive multi
touch, (hence the M I guess). The panel itself really looks the same.

I found this overview of EDT displays:
http://www.dmbtechnics.com/scripts/passthru.php?id=7

There seem to be quite a lot variants with the same panel...

Regarding timings, I just checked the documentation, Philipp's timing
really matches the documented ones, I miscalculated the vertical back
porch.

How do we resolve that?

I would suggest that I split out that patch and remove the et070080dh6
panel and send the other as a single patch to the dri-devel mailing list
as well.

Philipp, could you add my display type (et070080dh6) to the compatible
list of your mode/panel entry?

Does this sound reasonable?

--
Stefan
