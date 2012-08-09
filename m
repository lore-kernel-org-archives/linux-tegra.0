From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: How to get the irq flags from the dts file
Date: Thu, 9 Aug 2012 11:48:42 +0000
Message-ID: <201208091148.42748.arnd@arndb.de>
References: <1344509006.2295.148.camel@tegra-chromium-2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1344509006.2295.148.camel@tegra-chromium-2>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, frankyl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 09 August 2012, Wei Ni wrote:
> In the wlan driver, it will use platform_get_resource() to get the
> res->irq, res->flags, the irq number is right, but the flags will be
> IORESOURCE_IRQ, not the 0x04 (IRQF_TRIGGER_HIGH).
> The wlan driver wish this flags include the IRQF_TRGGER_* information,
> and it will use this flags to configure other hw settings. If it is
> wrong, the wlan can't work.
> 
> I checked drivers/of/irq.c, in function of_irq_to_resource(), it will
> set r->flags = IORESOURCE_IRQ directly, not read the flags from the dtb
> file. And I didn't find any of_xx api to get this flags.
> 
> How can I get this flags, does anyone has suggestion?

The driver should not need to know about thie flag. It gets read
by irq_create_of_mapping when calling teh xlate function and
gets set using irq_set_irq_type from there too.

	Arnd
