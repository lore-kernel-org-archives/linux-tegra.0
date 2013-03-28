From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: powergate: Don't error out if new state
 == old state
Date: Thu, 28 Mar 2013 17:23:50 -0600
Message-ID: <5154D106.40608@wwwdotorg.org>
References: <1364502904-5284-1-git-send-email-thierry.reding@avionic-design.de> <1364502904-5284-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364502904-5284-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 02:35 PM, Thierry Reding wrote:
> Don't treat it as an error if a partition is already in the same power
> state when a user wants to power it on or off. This allows code to
> proceed if no state change is required.

Joseph, I think you had argued specifically against making this change
in the past. Are you OK with this?
