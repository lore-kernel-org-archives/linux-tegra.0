From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/5] Add device tree support of audio (ALC5632) on PAZ00
 board
Date: Tue, 31 Jan 2012 23:12:43 -0800
Message-ID: <20120201071243.GB7399@quad.lixom.net>
References: <1327994757-26950-1-git-send-email-leon@leon.nu>
 <74CDBE0F657A3D45AFBB94109FB122FF178E124441@HQMAIL01.nvidia.com>
 <20120131194249.GF3429@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120131194249.GF3429-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 07:42:54PM +0000, Mark Brown wrote:
> On Tue, Jan 31, 2012 at 10:00:45AM -0800, Stephen Warren wrote:
> 
> > (Olof may wish to comment on whether he wishes the patches split up to
> > apply the Tegra/ASoC parts separately, or merge them into both trees,
> > to avoid any potential merge conflicts on the .dts files)
> 
> I'm leaving the last two patches to see what Olof thinks; Leon, if you
> get to it first splitting the DTS file update from the patch updating
> the machine driver would avoid any issue.

Agreed -- Leon, please just send the dts update separately.


-Olof
