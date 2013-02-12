From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] clk: tegra: initialise parent of uart clocks
Date: Tue, 12 Feb 2013 10:46:25 -0700
Message-ID: <511A7FF1.1030009@wwwdotorg.org>
References: <1360682279-23051-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360682279-23051-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, mturquette@linaro.org
Cc: swarren@nvidia.com, pgaikwad@nvidia.com, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/12/2013 08:17 AM, Laxman Dewangan wrote:
> Initialise the parent of UARTs to PLLP and disabling clock by
> default.

This patch wasn't tested, was it? Without the patch I just sent titled
"ARM: tegra: remove clock-frequency properties from serial nodes", the
UART clocks get turned off and the console breaks.

Anyway, I've applied this patch to Tegra's for-3.9/soc-ccf-fixes branch
along with that other patch, although I'll hold off on pushing them out
while I wait for an ack from Mike on this patch, and give the other one
time to get reviews.
