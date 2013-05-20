From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: use #include for all device trees
Date: Mon, 20 May 2013 11:46:54 -0600
Message-ID: <519A618E.4040400@wwwdotorg.org>
References: <1368473072-10145-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368473072-10145-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/13/2013 01:24 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Replace /include/ (dtc) with #include (C pre-processor) for all Tegra DT
> files, so that gcc -E handles the entire include tree, and hence any of
> those files can #include some other file e.g. for constant definitions.
> 
> This allows future use of #defines and header files in order to define
> names for various constants, such as the IDs and flags in GPIO
> specifiers. Use of those features will increase the readability of the
> device tree files.

I have applied this series, with patch 3/4 replaced with V3 of that patch.
