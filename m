From: Andrew Chew <AChew@nvidia.com>
Subject: RE: [PATCH v5 1/1] watchdog: Add tegra watchdog
Date: Tue, 11 Feb 2014 14:11:20 -0800
Message-ID: <643E69AA4436674C8F39DCC2C05F76386319AB352D@HQMAIL03.nvidia.com>
References: <1391738086-29142-1-git-send-email-achew@nvidia.com>
 <52F43D88.2050304@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52F43D88.2050304@roeck-us.net>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, "wim@iguana.be" <wim@iguana.be>, "rob@landley.net" <rob@landley.net>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "abrestic@chromium.org" <abrestic@chromium.org>, "dgreid@chromium.org" <dgreid@chromium.org>, "katierh@chromium.org" <katierh@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> On 02/06/2014 05:54 PM, Andrew Chew wrote:
> > Add a driver for the hardware watchdogs in NVIDIA Tegra SoCs (Tegra30
> > and later).  This driver will configure one watchdog timer that will
> > reset the system in the case of a watchdog timeout.
> >
> > This driver binds to the nvidia,tegra30-timer device node and gets its
> > register base from there.
> >
> > Signed-off-by: Andrew Chew <achew@nvidia.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks, Guenter.

Pinging other potential reviewers.  Any other comments for me, guys?
