From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [RFC] DPCM for Tegra
Date: Wed, 6 May 2020 21:39:58 +0530
Message-ID: <74e724ec-72c9-e06a-cada-85110c9b145b@nvidia.com>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
 <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
 <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
 <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
 <20200506155311.GG5299@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506155311.GG5299-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 5/6/2020 9:23 PM, Mark Brown wrote:
> On Wed, May 06, 2020 at 04:47:09PM +0200, Jerome Brunet wrote:
>> On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> XBAR currently exports all routing widgets which can be used to
>>> interconnect multiple components and thus implements Mux widgets. Fixing
>>> the routing paths in driver would limit anyone to try a different
>>> combination as per the need, unless driver is modified.
>> I did not mean that you should restrict the routing ability of your SoC,
>> quite the opposite actually.

>> You should just expose it correctly
> Yes, it's going to be less effort in the long run if nothing else.

This is what below reference tried to achieve in the original series, 
where all Mux widgets and corresponding kcontrols were exposed.
[1] 
http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/

However it has DAI declarations too, that was mainly because 
codec-to-codec links were used to connect multiple components. DT would 
expose all these links (please note that machine driver was not sent as 
part of the original series). May be with DPCM these additional DAIs can 
be avoided, but it comes with few challenges highlighted in this RFC patch.
