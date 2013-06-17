From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] regulator: tps62360: Fix crash in i2c_driver .probe
Date: Mon, 17 Jun 2013 12:16:06 -0600
Message-ID: <51BF5266.50205@wwwdotorg.org>
References: <1371491257-23791-1-git-send-email-ttynkkynen@nvidia.com> <1371491257-23791-3-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371491257-23791-3-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-tegra@vger.kernel.org

On 06/17/2013 11:47 AM, Tuomas Tynkkynen wrote:
> Commit "i2c: core: make it possible to match a pure device tree driver"
> changed semantics of the i2c probing for device tree devices.
> Device tree probed devices now get a NULL i2c_device_id pointer.
> This caused kernel panics due to NULL dereference.

Tested-by: Stephen Warren <swarren@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
