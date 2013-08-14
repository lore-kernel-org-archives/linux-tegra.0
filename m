From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: add Mic Jack to Cardhu device tree
Date: Wed, 14 Aug 2013 15:44:17 -0600
Message-ID: <520BFA31.1020508@wwwdotorg.org>
References: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org> <1376512027-28245-2-git-send-email-swarren@wwwdotorg.org> <20130814213700.GA21728@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130814213700.GA21728@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/14/2013 03:37 PM, Thierry Reding wrote:
> On Wed, Aug 14, 2013 at 02:27:07PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> This enables the microphone input jack, and hence allows audio to
>> be captured as well as played back.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- 
>> arch/arm/boot/dts/tegra114-dalmore.dts | 4 +++-
> 
> The commit subject says Cardhu, but you modify the Dalmore DTS
> here.

Yup. I'll fix that up when applying this.
