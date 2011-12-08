From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 4/8] arm/dt: tegra: Add Tegra APB DMA device tree binding
Date: Wed, 7 Dec 2011 16:28:46 -0800
Message-ID: <CAOesGMg6Ayu=gW_YMyrFpZ-r0ma1fgSsV3jYST5QvMJfpCVKjQ@mail.gmail.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
	<1323296033-28730-8-git-send-email-swarren@nvidia.com>
	<20111208001305.GE12945@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111208001305.GE12945-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 7, 2011 at 4:13 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Dec 07, 2011 at 03:13:46PM -0700, Stephen Warren wrote:
>> Document binding, and add the node to tegra20.dtsi.
>>
>> The driver isn't actually instantiated from this node yet, but the I2S
>> binding will rely on being able to refer to the APB DMA node using a
>> phandle.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>
> Thanks, applied to for-3.3/soc

Based on irc discussion, I dropped it again -- let's wait on the
interrupt specification changes to land to keep things consistent,
since this uses the new specifications.


-Olof
