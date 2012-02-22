From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 00/10] Add PWM framework and device tree support.
Date: Wed, 22 Feb 2012 16:02:08 +0000
Message-ID: <201202221602.09116.arnd@arndb.de>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329923841-32017-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 22 February 2012, Thierry Reding wrote:
> This patch series adds very rudimentary device-tree support for PWM
> devices. With all of these patches applied (plus one board-specific
> patch that is not included), I'm able to control the backlight on the
> device I'm working on using the sysfs interface provided by the pwm-bl
> driver and the backlight class.
> 
> This series is based on Sascha Hauer's series of patches[0] to add a
> generic PWM framework. The first patch in this series is taken from
> Sascha's branch, while the second patch enables each PWM chip to provide
> multiple PWM devices (the Blackfin and PXA drivers have been ported to
> the framework for reference). When this series is ready I think it would
> be best to merge patches 1 and 2. Currently a global namespace is still
> provided to keep backwards-compatibility with the legacy PWM API. In
> order to achieve this, the number of global PWM devices is limited to
> 1024. However, patch 2 introduces per-chip indexing of PWM devices in
> the core, so it should be easy to add an API to request a PWM device on
> a per-chip basis and get rid of the global namespace eventually. The
> device tree support code does not use the global namespace.

Hi Thierry,

I've just had a chance to look at your series and I think this looks
very good overall, great work!

I probably wouldn't bother merging patches 1 and 2 as you listed
in the TODO section, in order to keep the authorship of each
part obvious.

	Arnd
