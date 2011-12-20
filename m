From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 2/7] pwm: Allow chips to support multiple PWMs.
Date: Tue, 20 Dec 2011 14:32:52 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92E67@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> This commit modifies the PWM core to support multiple PWMs per struct
> pwm_chip. It achieves this in a similar way to how gpiolib works, by
> allowing PWM ranges to be requested dynamically (pwm_chip.base == -1) or
> starting at a given offset (pwm_chip.base >= 0). A chip specifies how

Echoing my previous comment: >0 would be better than >=0 here.

> many PWMs it controls using the npwm member. Each of the functions in
> the pwm_ops structure gets an additional argument that specified the PWM
> number (it can be converted to a per-chip index by subtracting the
> chip's base).

I think it'd be much more convenient for drivers if the PWM core passed
the device-relative PWM ID to the driver functions instead of the global
PWM ID; the common case is going to be for the driver to want to index
into some local array using the value, which means all drivers will have
to subtract the chip base. I doubt many drivers will care about the global
ID at all, and if they do, they can add the base back on.

> The total maximum number of PWM devices is currently fixed to 64, but
> can easily be made configurable via Kconfig.

GPIO (and IRQ?) have static sized arrays for this kind of purpose too,
and I'm pretty sure I've seen discussions that this was a mistake, or
at least something that will hopefully be reworked. pinctrl was similar,
but it was requested this be reworked, and now I think the pin ID ->
pin descriptor table is a radix tree.

In other words, can you do away with NR_PWM, and make it completely
dynamic?

-- 
nvpublic
