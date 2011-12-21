From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 2/7] pwm: Allow chips to support multiple PWMs.
Date: Wed, 21 Dec 2011 08:55:20 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92FEC@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-3-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E67@HQMAIL01.nvidia.com>
 <20111221075141.GB542@avionic-0098.mockup.avionic-design.de>
 <20111221140944.GA30666@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111221140944.GA30666-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, December 21, 2011 7:10 AM:
> * Thierry Reding wrote:
> > * Stephen Warren wrote:
> > > In other words, can you do away with NR_PWM, and make it completely
> > > dynamic?
> >
> > IRQ can be configured to use a radix tree if CONFIG_SPARSE_IRQ=y. I guess it
> > doesn't hurt to always use a radix tree for PWM, so I'll read up on it and
> > will try to address that in the next version.
> 
> I guess something like idr/ida can be used to dynamically assign a PWM ID,
> which would allow us to get rid of the bitmap. Then again, ida itself is not
> much more than a bitmap either. It would complicate things a little in that
> the ID assignment could no longer be assumed to be sequential for one given
> PWM chip, so the lookup (or rather mapping the ID to a chip-relative number)
> will be trickier to do.

You can support both dynamic assignment of IDs, and assigning each PWM
chip's IDs in a contiguous block. Just search for n contiguous free IDs
instead of looping n times looking for 1 free ID.

...
> pinctrl doesn't solve this because it uses statically allocated pin numbers.

Well, they're per-device IDs, so the issue doesn't really come up.

> Interestingly though it uses per-device numbering as well, which would be
> fine for PWM as well if we had only device tree based probing. In order to
> support other devices, we'll still need a global namespace.

Yes, that's probably true. I guess a global namespace is reasonable for
now. If you do plan to rework the API though, the sooner the better since
the tree will grow fewer users before it's done:-)

-- 
nvpublic
