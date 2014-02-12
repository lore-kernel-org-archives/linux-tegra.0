From: Andrew Chew <AChew@nvidia.com>
Subject: RE: [PATCH v5 1/1] watchdog: Add tegra watchdog
Date: Wed, 12 Feb 2014 13:43:37 -0800
Message-ID: <643E69AA4436674C8F39DCC2C05F76386319AB3891@HQMAIL03.nvidia.com>
References: <1391738086-29142-1-git-send-email-achew@nvidia.com>
 <52FBC2EF.4020000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52FBC2EF.4020000@wwwdotorg.org>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "wim@iguana.be" <wim@iguana.be>, "rob@landley.net" <rob@landley.net>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "abrestic@chromium.org" <abrestic@chromium.org>, "dgreid@chromium.org" <dgreid@chromium.org>, "katierh@chromium.org" <katierh@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> > +static void tegra_wdt_unref(struct watchdog_device *wdd) {
> > +	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
> > +
> > +	kref_put(&wdt->kref, tegra_wdt_release_resources); }
> 
> I forget why these were needed; they seem to do nothing.

The reason I did the whole kref thing was by following the guidance
in Documentation/watchdog/watchdog-kernel-api.txt, which says
that if the watchdog_device struct is dynamically allocated, then
one needs this.

> > +MODULE_LICENSE("GPL");
> 
> That should be "GPL v2" according to the license header in the file.

Done.  Thanks!
