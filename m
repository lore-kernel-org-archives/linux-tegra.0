From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v6 2/4] pwm_backlight: use power sequences
Date: Wed, 12 Sep 2012 16:15:33 -0600
Message-ID: <50510985.40308@wwwdotorg.org>
References: <1347443867-18868-1-git-send-email-acourbot@nvidia.com> <1347443867-18868-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1347443867-18868-3-git-send-email-acourbot@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Simon Glass <sjg@chromium.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Leela Krishna Amudala <l.krishna@samsung.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/12/2012 03:57 AM, Alexandre Courbot wrote:
> Make use of the power sequences specified in the device tree or platform
> data to control how the backlight is powered on and off.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Stephen Warren <swarren@wwwdotorg.org>

