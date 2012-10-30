From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ASoC: tegra: update spdif tx_atn_lvl on hw_params()
Date: Tue, 30 Oct 2012 12:23:32 -0600
Message-ID: <50901B24.9020904@wwwdotorg.org>
References: <1351607039-9027-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351607039-9027-1-git-send-email-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: swarren@nvidia.com, tiwai@suse.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/30/2012 08:23 AM, Dmitry Osipenko wrote:
> This prevents playing sound with wrong speed.

Reviewed-by: Stephen Warren <swarren@nvidia.com>

I guess this is fine, although as you say it makes little practical
difference in the mainline kernel; I'm sure there is much other work to
be done in order to support suspend/resume.
