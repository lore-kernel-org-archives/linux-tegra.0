From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: tegra20: Remove obsolete vbus-gpio properties
Date: Wed, 26 Jun 2013 11:19:45 -0600
Message-ID: <51CB22B1.2000903@wwwdotorg.org>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com> <1372240781-1017-5-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-5-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 03:59 AM, Mikko Perttunen wrote:
> USB VBUS regulators are now specified with the vbus-supply property
> instead of vbus-gpio, so remove the obsolete properties.

As far as patch scheduling goes, I might be simpler to send one series
to convert the driver to the new properties, then once that has been
merged into a kernel release, we can apply patches to remove all the
legacy properties from DT in a later kernel release. That will save the
requirement for any cross-subsystem merges.

Although, if the USB maintainers are OK with doing it all at once, and
we can make sure this series gets merged into a separate topic branch so
that I can take it into the Tegra tree to resolve any merge conflicts
with any other Tegra DT modifications if needed, then applying this all
at once is fine.
