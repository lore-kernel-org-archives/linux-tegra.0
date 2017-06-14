From: Erik Faye-Lund <kusmabite@gmail.com>
Subject: Re: [PATCH v2 08/22] drm/tegra: dc: Disable plane if it is invisible
Date: Wed, 14 Jun 2017 09:21:52 +0200
Message-ID: <CABPQNSa3A6289uyUFicF1whXD+Pdz=Pd0Q-ncNVLbaJbWd7ymA@mail.gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
 <97592f6df0eef08436a4835d2d4b698dc9f99948.1497394243.git.digetx@gmail.com>
Reply-To: kusmabite@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <97592f6df0eef08436a4835d2d4b698dc9f99948.1497394243.git.digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

T24gV2VkLCBKdW4gMTQsIDIwMTcgYXQgMToxNSBBTSwgRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPiB3cm90ZToKPiBPbiBUZWdyYTIwIGlmIHBsYW5lIGhhcyB3aWR0aCBvciBoZWln
aHQgZXF1YWwgdG8gMCwgaXQgd2lsbCBiZSBpbmZpbml0ZWx5Cj4gd2lkZSBvciB0YWxsLiBMZXQn
cyBkaXNhYmxlIHRoZSBwbGFuZSBpZiBpdCBpcyBpbnZpc2libGUgb24gYXRvbWljIHN0YXRlCj4g
Y29tbWl0dGluZyB0byBmaXggdGhlIGlzc3VlLiBUaGUgUm9ja2NoaXAgRFJNIGRyaXZlciBkb2Vz
IHRoZSBzYW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21h
aWwuY29tPgoKTG9va3MgZ29vZCBhcyBmYXIgYXMgSSBjYW4gdGVsbAoKUmV2aWV3ZWQtYnk6IEVy
aWsgRmF5ZS1MdW5kIDxrdXNtYWJpdGVAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
