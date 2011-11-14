From: Henning Heinold <heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: export tegra_chip_uid
Date: Mon, 14 Nov 2011 22:09:18 +0100
Message-ID: <20111114210917.GA23107@rhein.zuhause.netz>
References: <1321248620-5147-1-git-send-email-vwadekar@nvidia.com>
 <CAOesGMgPfECqOn6eOezAaf3gOm01ZG=CABT_=bi8PL_KbokBnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgPfECqOn6eOezAaf3gOm01ZG=CABT_=bi8PL_KbokBnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 14, 2011 at 10:37:17AM -0800, Olof Johansson wrote:
> On Sun, Nov 13, 2011 at 9:30 PM, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > the crypto driver will need this api to use
> > it in the rng calculations. in order to build
> > the crypto driver as a module, tegra_chip_uid
> > has to be exported.
> 
> Please use proper capitalization.
> 
> > Original author: Henning Heinold <heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org>
> 
> See instructions from Stephen on the other patch. Also, if Henning
> wrote it, why doesn't it have his signed-off-by?

Hi Varun,

feel free to add Signed-off-by from me.

Bye Henning
