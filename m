From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 12/24] PM / devfreq: tegra30: Inline all one-line
 functions
Date: Tue, 16 Jul 2019 16:35:51 +0300
Message-ID: <b7da3fa2-00d1-5bd6-408c-202c85be917d@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223633epcas4p3873704f3199126be0e8d5cb7454c7a51@epcas4p3.samsung.com>
 <20190707223303.6755-13-digetx@gmail.com>
 <b5634fbe-8bc1-0f04-e13b-6345dfbb5615@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b5634fbe-8bc1-0f04-e13b-6345dfbb5615@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.07.2019 15:26, Chanwoo Choi пишет:
> Hi Dmitry,
> 
> I'm not sure that it is necessary.
> As I knew, usally, the 'inline' is used on header file
> to define the empty functions.
> 
> Do we have to change it with 'inline' keyword?

The 'inline' attribute tells compiler that instead of jumping into the
function, it should take the function's code and replace the function's
invocation with that code. This is done in order to help compiler
optimize code properly, please see [1]. There is absolutely no need to
create a function call into a function that consists of a single
instruction.

[1] https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/Inline.html
