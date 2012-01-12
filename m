From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 7/9] arm/tegra: emc: device tree bindings
Date: Thu, 12 Jan 2012 12:50:54 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17801D1DCF@HQMAIL01.nvidia.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-8-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F18A6@HQMAIL01.nvidia.com>
	<CAOesGMjeVm_PcsBnxfKX9Oe96QUaCsJrvuESCRZq5vwq9gD5xA@mail.gmail.com>
 <CAPnjgZ2p63C1UNr_RxCcwKjjqJFXzZppXD14hXh85zXH35POrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ2p63C1UNr_RxCcwKjjqJFXzZppXD14hXh85zXH35POrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Thursday, January 12, 2012 1:04 PM:
> On Thu, Jan 5, 2012 at 5:20 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > On Thu, Jan 5, 2012 at 4:01 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
> >>> Device tree bindings for the EMC tables on tegra.
...
> I am looking at maybe bringing this into U-Boot.
> 
> Do you have an example of the ram-code table? Would it look something like this?

There's an example for Seaboard here:

http://patchwork.ozlabs.org/patch/132929/

The base EMC node was added earlier in the patch series:

http://patchwork.ozlabs.org/patch/132928/

-- 
nvpublic
