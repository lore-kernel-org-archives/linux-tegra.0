From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] Import latest Jetson TK1 spreadsheet
Date: Fri, 22 Apr 2016 13:54:32 -0600
Message-ID: <571A8178.4080705@wwwdotorg.org>
References: <1461275892-3798-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461275892-3798-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/21/2016 03:58 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This imports v11 of "Jetson TK1 Development Platform Pin Mux" from
> https://developer.nvidia.com/embedded/downloads.
>
> The new version defines the mux option for the MIPI pad ctrl selection.
> The OWR pin no longer has an entry in the configuration table because
> the only mux option it support is OWR, that feature isn't supported, and
> hence can't conflict with any other pin. This pin can only usefully be
> used as a GPIO.

Applied.
