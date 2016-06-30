From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Thu, 30 Jun 2016 17:19:07 +0900
Message-ID: <CAAVeFuJS-f7HGDoCk6yPeb2YWyazuh6wOD1icEDjDE01VS3Ypg@mail.gmail.com>
References: <1467220913-15006-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467220913-15006-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 30, 2016 at 2:21 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> Enable the ChromeOS Embedded Controller, its I2C tunnel driver, and
> the BA27XXX battery driver. These are all used on the Tegra210 Smaug
> platform.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>

Can see the bq27742 in /sys and query its state.
