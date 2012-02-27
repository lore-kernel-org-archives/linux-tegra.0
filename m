From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 15/20] tegra: fdt: Add function to return peripheral/clock
 ID
Date: Mon, 27 Feb 2012 16:41:18 -0700
Message-ID: <4F4C149E.3070505@nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org> <1330375973-10681-16-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-16-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/27/2012 01:52 PM, Simon Glass wrote:
> A common requirement is to find the clock ID for a peripheral. This is the
> second cell of the 'clocks' property (the first being the phandle itself).

> +int clock_decode_periph_id(const void *blob, int node)

> +	valid = clock_periph_id_isvalid(id);

clock_periph_id_isvalid() is not the correct function to use here; the
code should be checking for invalid IDs in the CAR binding, not invalid
IDs in the HW periph ID definition. They're different.

Just to be explicit, the function you need here would be:

int clkid_to_periphid(int clkid)
{
    if (clk_id > 95)
        return -1;
    switch (clk_id) {
    case 1:
    case 2:
    case 7:
    case 10:
    case 20:
    case 30:
    case 35:
    case 49:
    case 56:
    case 74:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 91:
    case 95:
        return -1;
    default:
        return clkid;
    }
}

-- 
nvpublic
