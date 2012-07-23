From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to *_noirq
Date: Mon, 23 Jul 2012 12:24:38 -0600
Message-ID: <500D96E6.4060507@wwwdotorg.org>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com> <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org, swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On 07/10/2012 05:20 AM, Laxman Dewangan wrote:
> To provide the late suspend and early resume for i2c
> driver, convert the suspend/resume as
> 	suspend-> suspend_noirq
> 	resume -> resume_noirq
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Why do we need this change?

IIRC, I proposed it before solely to solve some suspend/resume ordering
issues, and Colin Cross NAKd it. These days, deferred probe should make
this change unnecessary.

Unless there's a really good reason for this change, I'd tend to request
reverting it.
