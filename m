From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: tegra: joystick input in tegra_defconfig
Date: Mon, 12 May 2014 10:32:20 -0600
Message-ID: <5370F794.2020800@wwwdotorg.org>
References: <1399883209-31169-1-git-send-email-acourbot@nvidia.com> <1399883209-31169-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399883209-31169-2-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 05/12/2014 02:26 AM, Alexandre Courbot wrote:
> NVIDIA SHIELD embeds a USB controller. Compile the corresponding support

USB controller or USB joystick?

> as a module in tegra_defconfig.

Why make this a module rather than built-in. Almost everything else in
tegra_defconfig is built-in, except brcmfmac since it doesn't handle
lack of firmware availability at probe time.
