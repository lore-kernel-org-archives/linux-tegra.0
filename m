From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH] Allow --boards to add to not replace the set
 of enabled boards
Date: Thu, 01 May 2014 11:13:17 -0600
Message-ID: <536280AD.5060201@wwwdotorg.org>
References: <1398887114-9774-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398887114-9774-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/30/2014 01:45 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The following already work:
> 
> Build all boards that are enabled by default:
> ./build build
> 
> Build a specific set of boards:
> ./build --boards beaver,jetson-tk1 build
> 
> Sometimes it's nice to build all boards that are enabled by default,
> plus a few others which aren't. This patch enables the following syntax
> for that:
> ./build --boards +jetson-tk1 build

Applied.
