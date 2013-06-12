From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/7] usb: phy: export ulpi_viewport_access_ops
Date: Wed, 12 Jun 2013 10:11:27 -0600
Message-ID: <51B89DAF.4020703@wwwdotorg.org>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org> <1370462589-3090-2-git-send-email-swarren@wwwdotorg.org> <20130612150603.GA15056@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130612150603.GA15056-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/12/2013 09:06 AM, Felipe Balbi wrote:
> On Wed, Jun 05, 2013 at 02:03:03PM -0600, Stephen Warren wrote:
>> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> 
>> In order to build a ULPI PHY driver as a module, this symbol
>> needs to be exported.
>> 
>> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> 
>> [swarren, reworked Manjunath's patches to split them more
>> logically] Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> 
>> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> This should go straight through Greg:

All the patches in this series build on top of each-other, so I think
need to be applied in the same branch. Applying this patch in branch A
but the others in branch B will cause the build to fail in branch B if
the driver is built as a module, since ulpi_viewport_access_ops isn't
exported, right?

And this series is also based on top of all the Tegra driver changes
in your PHY branch, so I believe that is the correct place to apply this.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
