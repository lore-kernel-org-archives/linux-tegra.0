From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: tegra: Add new DT property to USB node.
Date: Mon, 17 Dec 2012 13:18:18 -0800
Message-ID: <20121217211818.GA20835@kroah.com>
References: <1355468348-8821-1-git-send-email-vbyravarasu@nvidia.com>
 <1355468348-8821-2-git-send-email-vbyravarasu@nvidia.com>
 <50CF89AF.3000308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50CF89AF.3000308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 17, 2012 at 02:07:59PM -0700, Stephen Warren wrote:
> On 12/13/2012 11:59 PM, Venu Byravarasu wrote:
> > As Tegra USB host driver is using instance number for resetting
> > PORT0 twice, adding a new DT property for handling this.
> 
> Alan, Greg, Felip,e
> 
> This series looks fine to me.
> 
> I'd like to take all the Tegra-related USB patches through the Tegra
> tree for 3.9 if possible (so I'm looking for your acks here). I believe
> Venu plans to significantly clean up the EHCI/PHY driver split for
> Tegra, rework the drivers, and add support for Tegra30 in addition to
> Tegra20. Some of this requires changes to some Tegra board files and
> device trees to maintain "git bisect" I don't know for sure yet, but I
> believe that rework may also end up conflicting with other clock-related
> rework that will show up for Tegra in 3.9. Are you OK with this? I'll
> certainly look for your review/acks on the patches before picking them
> up though.

You can't pick anything up for 3.9 until after 3.8-rc1 is out, according
to the rules of linux-next, so please wait until that kernel is out
before doing anything.  Given the timing of 3.8-rc1, and my current
vacation schedule, I'm not going to be able to do _any_ code review for
the rest of the year, sorry.

After that, I'll be glad to review this.

greg k-h
