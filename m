From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v1] brcmfmac: Keep OOB wake-interrupt disabled when it
 shouldn't be enabled
Date: Wed, 18 Dec 2019 19:09:20 +0000 (UTC)
Message-ID: <20191218190920.A4AF8C447A0@smtp.codeaurora.org>
References: <20191215184224.11827-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20191215184224.11827-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> NVIDIA Tegra SoCs do not like when OOB wake is enabled and WiFi interface
> is in DOWN state during suspend. This results in a CPU hang on programming
> OOB wake-up state of the GPIO controller during of system's suspend.
> 
> The solution is trivial: don't enable wake for the OOB interrupt when it
> should be disabled.
> 
> This fixes hang on Tegra20 (Acer A500) and Tegra30 (Nexus 7) devices which
> are using BCM4329 and BCM4330 WiFi chips respectively.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Patch applied to wireless-drivers-next.git, thanks.

a32de68edab7 brcmfmac: Keep OOB wake-interrupt disabled when it shouldn't be enabled

-- 
https://patchwork.kernel.org/patch/11293127/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
