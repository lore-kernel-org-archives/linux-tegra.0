From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] arm/tegra: fuse: add functions to access chip
 revision
Date: Thu, 5 Jan 2012 14:08:43 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17761F1814@HQMAIL01.nvidia.com>
References: <1324599468-12845-5-git-send-email-olof@lixom.net>
 <1325742641-384-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325742641-384-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, January 04, 2012 10:51 PM:
> Add function to get chip revision, and print it out at boot time.
> 
> Restructure the fuse access to just use cached variables instead
> of always reading the fuses, and export those variables directly
> instead of using accessor functions.
> 
> Add a SKU ID table of currently known values.
> 
> Based on code originally by Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>.
> 
> Changes since v1:
> 
> * Add A01 minor rev support
> * Don't decode for A03p on anything but T2x
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
