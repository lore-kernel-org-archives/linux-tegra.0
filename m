From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] memory: tegra: Introduce memory client hot reset
 API
Date: Fri, 15 Dec 2017 02:04:27 +0300
Message-ID: <472eb305-fb76-e5a2-0b90-d89054463a2d@gmail.com>
References: <1b8256265365e9b6dd431aeaf96f2ee9d39f484b.1513134137.git.digetx@gmail.com>
 <b9cafa40656c384f47772488d0c1cb7ea1555cc7.1513134137.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b9cafa40656c384f47772488d0c1cb7ea1555cc7.1513134137.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 13.12.2017 06:12, Dmitry Osipenko wrote:
> In order to reset busy HW properly, memory controller needs to be
> involved, otherwise it possible to get corrupted memory if HW was reset
> during DMA. Introduce memory client 'hot reset' API that will be used
> for resetting busy HW. The primary users are memory clients related to
> video (decoder/encoder/camera) and graphics (2d/3d).

I forgot to export symbol and realized that assert/deassert functions would be
necessary. For now I'll wait for the comments to v1.
