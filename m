From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [Nouveau] [PATCH v2 2/3] drm/ttm: introduce dma cache sync helpers
Date: Tue, 24 Jun 2014 14:27:49 +0200
Message-ID: <53A96EC5.3030701@canonical.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
 <1403603667-11302-3-git-send-email-acourbot@nvidia.com>
 <20140624100220.GK32514@n2100.arm.linux.org.uk> <53A953E6.2030503@nvidia.com>
 <53A95910.20104@nvidia.com>
 <CAAVeFu+rbCViC87kYCLfxGV18iYq=Pa0ABb+L=iNiYPLn+mR8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAAVeFu+rbCViC87kYCLfxGV18iYq=Pa0ABb+L=iNiYPLn+mR8Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <gnurou@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

b3AgMjQtMDYtMTQgMTQ6MjMsIEFsZXhhbmRyZSBDb3VyYm90IHNjaHJlZWY6Cj4gT24gVHVlLCBK
dW4gMjQsIDIwMTQgYXQgNzo1NSBQTSwgQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRp
YS5jb20+IHdyb3RlOgo+PiBPbiAwNi8yNC8yMDE0IDA3OjMzIFBNLCBBbGV4YW5kcmUgQ291cmJv
dCB3cm90ZToKPj4+IE9uIDA2LzI0LzIwMTQgMDc6MDIgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBM
aW51eCB3cm90ZToKPj4+PiBPbiBUdWUsIEp1biAyNCwgMjAxNCBhdCAwNjo1NDoyNlBNICswOTAw
LCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToKPj4+Pj4gRnJvbTogTHVjYXMgU3RhY2ggPGRldkBs
eW54ZXllLmRlPgo+Pj4+Pgo+Pj4+PiBPbiBhcmNoaXRlY3R1cmVzIGZvciB3aGljaCBhY2Nlc3Mg
dG8gR1BVIG1lbW9yeSBpcyBub24tY29oZXJlbnQsCj4+Pj4+IGNhY2hlcyBuZWVkIHRvIGJlIGZs
dXNoZWQgYW5kIGludmFsaWRhdGVkIGV4cGxpY2l0bHkgYXQgdGhlCj4+Pj4+IGFwcHJvcHJpYXRl
IHBsYWNlcy4gSW50cm9kdWNlIHR3byBzbWFsbCBoZWxwZXJzIHRvIG1ha2UgdGhpbmdzCj4+Pj4+
IGVhc3kgZm9yIFRUTS1iYXNlZCBkcml2ZXJzLgo+Pj4+Cj4+Pj4gSGF2ZSB5b3UgcnVuIHRoaXMg
d2l0aCBETUEgQVBJIGRlYnVnZ2luZyBlbmFibGVkPyAgSSBzdXNwZWN0IHlvdSBoYXZlbid0LAo+
Pj4+IGFuZCBJIHJlY29tbWVuZCB0aGF0IHlvdSBkby4KPj4+Cj4+PiAjIGNhdCAvc3lzL2tlcm5l
bC9kZWJ1Zy9kbWEtYXBpL2Vycm9yX2NvdW50Cj4+PiAxNjI2MjEKPj4+Cj4+PiAo4pWvwrDilqHC
sO+8ieKVr++4tSDilLvilIHilLspCj4+Cj4+ICpwdXRzIHRhYmxlIGJhY2sgb24gaXRzIGZlZXQq
Cj4+Cj4+IFNvLCB5ZWFoIC0gVFRNIG1lbW9yeSBpcyBub3QgYWxsb2NhdGVkIHVzaW5nIHRoZSBE
TUEgQVBJLCBoZW5jZSB3ZSBjYW5ub3QKPj4gdXNlIHRoZSBETUEgQVBJIHRvIHN5bmMgaXQuIFRo
YW5rcyBSdXNzZWxsIGZvciBwb2ludGluZyBpdCBvdXQuCj4+Cj4+IFRoZSBvbmx5IGFsdGVybmF0
aXZlIEkgc2VlIGhlcmUgaXMgdG8gZmx1c2ggdGhlIENQVSBjYWNoZXMgd2hlbiBzeW5jaW5nIGZv
cgo+PiB0aGUgZGV2aWNlLCBhbmQgaW52YWxpZGF0ZSB0aGVtIGZvciB0aGUgb3RoZXIgZGlyZWN0
aW9uLiBPZiBjb3Vyc2UgaWYgdGhlCj4+IGRldmljZSBoYXMgY2FjaGVzIG9uIGl0cyBzaWRlIGFz
IHdlbGwgdGhlIG9wcG9zaXRlIG9wZXJhdGlvbiBtdXN0IGFsc28gYmUKPj4gZG9uZSBmb3IgaXQu
IEd1ZXNzIHRoZSBvbmx5IHdheSBpcyB0byBoYW5kbGUgaXQgYWxsIGJ5IG91cnNlbHZlcyBoZXJl
LiA6Lwo+IC4uLiBhbmQgaXQgcmVhbGx5IHN1Y2tzLiBCYXNpY2FsbHkgaWYgd2UgY2Fubm90IHVz
ZSB0aGUgRE1BIEFQSSBoZXJlCj4gd2Ugd2lsbCBsb3NlIHRoZSBjb252ZW5pZW5jZSBvZiBoYXZp
bmcgYSBwb3J0YWJsZSBBUEkgdGhhdCBkb2VzIGp1c3QKPiB0aGUgcmlnaHQgdGhpbmcgZm9yIHRo
ZSB1bmRlcmx5aW5nIHBsYXRmb3JtLiBXaXRob3V0IGl0IHdlIHdvdWxkIGhhdmUKPiB0byBkdXBs
aWNhdGUgYXJtX2lvbW11X3N5bmNfc2luZ2xlX2Zvcl9jcHUvZGV2aWNlKCkgYW5kIHdlIHdvdWxk
IG9ubHkKPiBoYXZlIHN1cHBvcnQgZm9yIEFSTS4KPgo+IFRoZSB1c2FnZSBvZiB0aGUgRE1BIEFQ
SSB0aGF0IHdlIGFyZSBkb2luZyBtaWdodCBiZSBpbGxlZ2FsLCBidXQgaW4KPiBlc3NlbmNlIGl0
IGRvZXMgZXhhY3RseSB3aGF0IHdlIG5lZWQgLSBhdCBsZWFzdCBmb3IgQVJNLiBXaGF0IGFyZSB0
aGUKPiBhbHRlcm5hdGl2ZXM/CkNvbnZlcnQgVFRNIHRvIHVzZSB0aGUgZG1hIGFwaT8gOi0pCgp+
TWFhcnRlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
