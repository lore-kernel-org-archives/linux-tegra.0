From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 04/16] pwm: Add table-based lookup for static mappings
Date: Sun, 1 Apr 2012 23:20:46 +0800
Message-ID: <20120401152042.GE2395@S2101-09.ap.freescale.net>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-5-git-send-email-thierry.reding@avionic-design.de>
 <20120329220342.GK4153@opensource.wolfsonmicro.com>
 <20120330050641.GA21823@avionic-0098.mockup.avionic-design.de>
 <20120330101800.GD21950@opensource.wolfsonmicro.com>
 <20120330103840.GB961@avionic-0098.mockup.avionic-design.de>
 <20120331143021.GA18382@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120331143021.GA18382-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Mar 31, 2012 at 04:30:21PM +0200, Thierry Reding wrote:
...
> The best solution that I could come up with is to not pass the index into the
> of_pwm_request() function but rather forward the consumer name as passed into
> pwm_get(). The of_pwm_request() could use the "pwm-names" property to do a
> reverse lookup of the index and request that. One good thing about that would
> be that I no longer need to export the of_pwm_request() function.

I never understand why of_pwm_request() needs to be exported anyway.
pwm_get() should be the only interface to pwm new/DT users, IMO.

> The "bad"
> thing is that it'll make the "pwm-names" property mandatory if more than a
> single PWM is requested.
> 
You do not have to make it mandatory, but anyone requesting any pwm
other than the first on in "pwms" list should fail.

> Does that sound reasonable?
> 
The above is exactly what clock DT does, so it sounds reasonable to me.

And I would expect the next version can just turn the second parameter
of pwm_get() into the one that will be used to identify the pwm device
rather than adding one more parameter.  Then we have pwm API well
aligned with clk and regulator.

-- 
Regards,
Shawn
