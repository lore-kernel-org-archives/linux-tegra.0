From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: RESEND: Tegra30: Unknown SKU 177
Date: Wed, 19 Aug 2015 22:40:40 +0200
Message-ID: <1440016840.3047.10.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi there

Remember there was already a thread started April 8 about this:

http://thread.gmane.org/gmane.linux.ports.tegra/16317

Unfortunately I don't think there was any conclusion on NVIDIA's side
about this yet. Running Linux 4.2.0-rc7-next-20150818 I just noticed
that our latest Apalis/Colibri T30 modules do still suffer from such
messages during boot:

Apalis T30 1GB IT V1.1A

[    0.050615] Tegra Unknown SKU 176
[    0.050680] Tegra Revision: A03 SKU: 176 CPU Process: 2 SoC Process:
0

Colibri T30 V1.1E

[    0.050562] Tegra Unknown SKU 177
[    0.050630] Tegra Revision: A03 SKU: 177 CPU Process: 3 SoC Process:
0

Could somebody at NVIDIA please comment on how to proceed on this?

Thanks!

Cheers

Marcel
