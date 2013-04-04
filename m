From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Tegra20 Tamonten configurations
Date: Thu, 04 Apr 2013 11:50:55 -0600
Message-ID: <515DBD7F.1010800@wwwdotorg.org>
References: <1365067814-12925-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365067814-12925-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:30 AM, Thierry Reding wrote:
> In addition to providing the BCT configuration that is common for all
> Tegra20 Tamonten-derived boards, add scripts to build images that can
> be flashed to NAND for the Plutux, Medcom-Wide and TEC boards.

I wonder why there's a need for board-specific sub-directories? After
all, those boards all use the same BCT file, and the image config files
are all identical.

Other than that, this looks fine, and I'd be happy to run it through our
internal review process to get it added to cbootimage.
