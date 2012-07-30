From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Add Avionic Design Medcom-Wide support
Date: Mon, 30 Jul 2012 10:44:44 -0600
Message-ID: <5016B9FC.5040107@wwwdotorg.org>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de> <1343228775-1330-2-git-send-email-thierry.reding@avionic-design.de> <5012F95E.9050200@wwwdotorg.org> <20120730080550.GE15245@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120730080550.GE15245-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/30/2012 02:05 AM, Thierry Reding wrote:
...
> Perhaps it even makes sense to separate commonalities out into a 
> tegra20-tamonten.dtsi?

Yes, if a bunch of the .dts file is driven by the main CPU board
rather than what it plugs into, that probably makes sense.
