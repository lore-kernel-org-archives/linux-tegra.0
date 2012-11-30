From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: dt: tegra: cardhu: Add drm components
Date: Fri, 30 Nov 2012 12:28:49 -0700
Message-ID: <50B908F1.8000407@wwwdotorg.org>
References: <1354254256-10212-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354254256-10212-1-git-send-email-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: thierry.reding@avionic-design.de, linux@arm.linux.org.uk, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/29/2012 10:44 PM, Mark Zhang wrote:
> This patch adds the RGB & HDMI nodes in Tegra 30 cardhu's dts.
> This makes the LVDS & HDMI working.

This still doesn't add any of the backlight/panel GPIO programming,
which I believe is required before we enable any LCDs. We could add the
HDMI node without that though.
